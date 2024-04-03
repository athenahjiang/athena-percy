package com.athenahealth.collector.parser;

import java.io.File;
import java.util.List;

public class Main {
  public static void main(String[] args) {
    Parser parser = new Parser();

    // 1561458a432
    File file_432_69874 = new File("src/main/resources/samples/432-69874.x12");
    // 886178a94
    File file_94_28088654 = new File("src/main/resources/samples/94-28088654.x12");

    //    parseNM1(parser, file_94_28088654);
    parseEb(parser, file_94_28088654);
  }

  public static void parseEb(Parser parser, File file) {
    List<List<String>> lines = parser.getLines(file, "EB");
    List<List<String>> lines1;
    List<List<String>> lines2;
    List<List<String>> lines3;
    List<List<String>> lines4;

    lines1 = parser.filterEbLines(lines, 3, "UC");
    lines2 = parser.filterEbLines(lines1, 1, "B");
    lines3 = parser.filterEbLines(lines2, 12, "Y~");
    lines4 = parser.filterEbLines(lines3, 2, "IND");
    lines4.forEach(parser::printEbLine);
  }

  public static void parseNM1(Parser parser, File file) {
    List<List<String>> lines = parser.getLines(file, "NM1");
    lines = parser.filterNm1Lines(lines, 1, "P3");
    lines.forEach(System.out::println);
  }
}
