#!/bin/bash
if [ ! -d "~/Library/Developer/Xcode/Templates" ]
then
  mkdir ~/Library/Developer/Xcode/Templates
fi
if [ ! -d "~/Library/Developer/Xcode/Templates/Custom" ]
then
  mkdir ~/Library/Developer/Xcode/Templates/Custom
fi
cp -R -p Custom/* ~/Library/Developer/Xcode/Templates/Custom
