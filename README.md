# SoftwareAnalyzer
<!-- [![Build Status](https://travis-ci.com/ObjectProfile/SoftwareAnalyzer.svg?branch=master)](https://travis-ci.com/ObjectProfile/SoftwareAnalyzer) -->
[![CI](https://github.com/ObjectProfile/SoftwareAnalyzer/actions/workflows/runTest.yml/badge.svg)](https://github.com/ObjectProfile/SoftwareAnalyzer/actions/workflows/runTest.yml)

Tool suite to do software analysis. It provides the necesary to analyze Java, C, and Pharo applications.

```Smalltalk
[ Metacello new
    baseline: 'SoftwareAnalyzer';
    repository: 'github://ObjectProfile/SoftwareAnalyzer';
    load. ] on: MCMergeOrLoadWarning do: [:warning | warning load ]
```
