#!/bin/bash
sudo apt install openjdk-11-jdk
sudo apt install scala
wget https://dlcdn.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
cd Downloads
tar -xzf spark-3.5.3-bin-hadoop3.tgz
mv spark-3.5.3-bin-hadoop3 ~/spark
cd ~/spark/bin
echo "hello this is a simple and simple spark program and this is hello" > input.txt 
./spark-shell
var textFile=sc.textFile("input.txt")
var words=textFile.flatMap(line=>line.split(" "))
var wordPairs=words.map(word=>(word,1))
var wordCount=wordPairs.reduceByKey((a,b)=>a+b)
wordCount.saveAsTextFile("output")
cat output/*