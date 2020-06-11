#!/bin/bash

if [ ! -d ~/Library/Developer/Xcode/Templates ]
then
  mkdir ~/Library/Developer/Xcode/Templates
fi

if [ ! -d ~/Library/Developer/Xcode/Templates/File\ Templates ]
then
  mkdir ~/Library/Developer/Xcode/Templates/File\ Templates
fi

if [ ! -d ~/Library/Developer/Xcode/Templates/File\ Templates/JKCS ]
then
  mkdir ~/Library/Developer/Xcode/Templates/File\ Templates/JKCS
fi

if [ ! -d ~/Library/Developer/Xcode/Templates/Project\ Templates ]
then
  mkdir ~/Library/Developer/Xcode/Templates/Project\ Templates
fi

if [ ! -d ~/Library/Developer/Xcode/Templates/Project\ Templates/JKCS ]
then
  mkdir ~/Library/Developer/Xcode/Templates/Project\ Templates/JKCS
fi

cp -R -p File\ Templates/JKCS/* ~/Library/Developer/Xcode/Templates/File\ Templates/JKCS
