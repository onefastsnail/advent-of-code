package com.onefastsnail.utils

import java.io.File

fun readFileLines(fileName: String): List<String> = File(fileName).useLines { it.toList() }

fun readFile(fileName: String): String = File(fileName).readText()