# HPC-Ontology

Public release of the HPC ontology source files, LLNL-MI-829145.

The current web release is hosted at
* https://hpc-fair.github.io/ontology/

# Steps to Build and Publish a New Release

## Build the release

Clone this repo to a local machine: e.g. Mac OSX laptop

* git clone git@github.com:HPC-FAIR/HPC-Ontology-Public.git
* cd HPC-Ontology-Public
* make clean
* make all

a new subfolder named release will be generated. 

## Polish some sections

Mostly editing index-en.html to have suitable sections
* introduction
* references
* acknowledgement


## Push to the gitpage website

clone the repo for the website hosting the ontology
* git clone git@github.com:HPC-FAIR/hpc-fair.github.io.git


backup previous release into a new subfolder under ontology
* cd hpc-fair.github.io.git/ontology/
* mkdir 1.0.0
* mv the files, folders into 1.0.0

move the content of the new release (e.g. 1.1.0) to
 mv HPC-Ontology-Public/release  hpc-fair.github.io.git/ontology/1.1.0
   
also copy the content to parent folder

# Publication

Chunhua Liao, Pei-Hung Lin, Gaurav Verma, Tristan Vanderbruggen, Murali Emani, Zifan Nan, Xipeng Shen, HPC Ontology: Towards a Unified Ontology for Managing Training Datasets and AI Models for High-Performance Computing, 2021 IEEE/ACM Workshop on Machine Learning in High Performance Computing Environments (MLHPC), LLNL-CONF-826494
