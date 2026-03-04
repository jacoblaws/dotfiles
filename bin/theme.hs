#!/usr/bin/env runhaskell

{-# LANGUAGE ApplicativeDo #-}

import Options.Applicative
import System.Directory (copyFile, getHomeDirectory)
import System.FilePath (FilePath, (</>))

type Directory = FilePath
type Extension = FilePath
type FileName = String
type Mode = String
type Name = String
type Path = FilePath

data Theme = Theme Name Mode
data Program = Program Name Directory FileName Extension

{- FOURMOLU_DISABLE -}

programs :: [Program]
programs =
  [ Program "Ghostty"       ".config/ghostty/themes"            "current"    ""
  , Program "Kitty"         ".config/kitty/themes"              "current"    ".conf"
  , Program "Gtk-3.0"       ".config/gtk-3.0/themes"            "current"    ".css"
  , Program "Gtk-4.0"       ".config/gtk-4.0/themes"            "current"    ".css"
  , Program "Sioyek"        ".config/sioyek"                    "prefs_user" ".config"
  , Program "Zathura"       ".config/zathura"                   "zathurarc"  ""
  , Program "Zellij Theme"  ".config/zellij/themes"             "custom"     ".kdl"
  , Program "Zellij Layout" ".config/zellij/layouts"            "default"    ".kdl"
  , Program "Zen Browser"   ".config/zen/default/chrome/themes" "current"    ".css"
  ]

{- FOURMOLU_ENABLE -}

main :: IO [()]
main = genFiles =<< execParser opts
 where
  parser = do
    name <- strArgument (metavar "NAME")
    mode <- strArgument (metavar "MODE")
    pure (Theme name mode)
  opts = info (parser <**> helper) fullDesc

genFiles :: Theme -> IO [()]
genFiles theme = mapM (set theme) programs

set :: Theme -> Program -> IO ()
set (Theme theme mode) (Program prog dir fname ext) = do
  homeDir <- getHomeDirectory
  let themeFile = homeDir </> dir </> theme ++ "-" ++ mode
  let newFile = homeDir </> dir </> fname ++ ext

  putStrLn $ "Setting " ++ prog ++ " to " ++ theme ++ " " ++ mode
  copyFile themeFile newFile
