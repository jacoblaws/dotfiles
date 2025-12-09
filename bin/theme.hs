#!/usr/bin/env runhaskell

{-# LANGUAGE ApplicativeDo #-}

import Options.Applicative
import System.Directory (copyFile, getHomeDirectory)
import System.FilePath (FilePath, (</>))

type Name = String
type Mode = String
type Path = FilePath
type Extension = FilePath

data Theme = Theme Name Mode
data Program = Program Name Path Extension
data Options = Options {name :: String, mode :: String}

programs :: [(Name, Extension)]
programs = [("ghostty", ""), ("kitty", ".conf")]

main :: IO [()]
main = genFiles =<< execParser opts
 where
  parser = do
    name <- strOption (long "name" <> short 'n' <> help "Colorscheme name")
    mode <- strOption (long "mode" <> short 'm' <> help "Colorscheme mode (dark/light)")
    pure (Options name mode)
  opts = info (parser <**> helper) fullDesc

genFiles :: Options -> IO [()]
genFiles (Options name mode) = do
  let theme = Theme name mode
  programs <- sequence [program n ext | (n, ext) <- programs]
  mapM (set theme) programs

program :: Name -> Extension -> IO Program
program name ext = do
  homeDir <- getHomeDirectory
  let path = homeDir </> ".config" </> name </> "themes"
  return $ Program name path ext

set :: Theme -> Program -> IO ()
set (Theme theme mode) (Program prog path ext) = do
  let themeFile = path ++ "/" ++ theme ++ "-" ++ mode ++ ext
  let newFile = path ++ "/current" ++ ext

  putStrLn $ "Setting " ++ prog ++ " to " ++ theme ++ " " ++ mode
  copyFile themeFile newFile
