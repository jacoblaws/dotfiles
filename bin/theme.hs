#!/usr/bin/env runhaskell

{-# LANGUAGE ApplicativeDo #-}

import Options.Applicative
import System.Directory (copyFile, getHomeDirectory)
import System.FilePath (FilePath, (</>))

type Name = String
type Mode = String
type FileName = String
type Path = FilePath
type Directory = FilePath
type Extension = FilePath

data Theme = Theme Name Mode
data Program = Program Name Directory FileName Extension

data Options = Options {name :: String, mode :: String}

{- FOURMOLU_DISABLE -}

programs :: [Program]
programs =
  [ Program "Ghostty"       ".config/ghostty/themes"   "current" ""
  , Program "Kitty"         ".config/kitty/themes"     "current" ".conf"
  , Program "Gtk-3.0"       ".config/gtk-3.0/themes"   "current" ".css"
  , Program "Gtk-4.0"       ".config/gtk-4.0/themes"   "current" ".css"
  , Program "Zellij Theme"  ".config/zellij/themes"    "custom"  ".kdl"
  , Program "Zellij Layout" ".config/zellij/layouts"   "default" ".kdl"
  ]

{- FOURMOLU_Enable -}

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
  mapM (set theme) programs

set :: Theme -> Program -> IO ()
set (Theme theme mode) (Program prog dir fname ext) = do
  homeDir <- getHomeDirectory
  let themeFile = homeDir </> dir </> theme ++ "-" ++ mode
  let newFile = homeDir </> dir </> fname ++ ext

  putStrLn $ "Setting " ++ prog ++ " to " ++ theme ++ " " ++ mode
  copyFile themeFile newFile
