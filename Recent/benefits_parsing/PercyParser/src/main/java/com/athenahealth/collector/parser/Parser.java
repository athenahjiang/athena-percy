package com.athenahealth.collector.parser;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

@SuppressWarnings("rawtypes")
public class Parser {

  private final HashMap eb01Map;
  private final HashMap eb02Map;
  private final HashMap eb03Map;
  private final HashMap eb04Map;
  private final HashMap eb06Map;

  public Parser() {
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      String basePath = "src/main/resources/benefits/";
      eb01Map = objectMapper.readValue(new File(basePath + "eb01.json"), HashMap.class);
      eb02Map = objectMapper.readValue(new File(basePath + "eb02.json"), HashMap.class);
      eb03Map = objectMapper.readValue(new File(basePath + "eb03.json"), HashMap.class);
      eb04Map = objectMapper.readValue(new File(basePath + "eb04.json"), HashMap.class);
      eb06Map = objectMapper.readValue(new File(basePath + "eb06.json"), HashMap.class);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public List<List<String>> getLines(File file, String lineName) {
    try {
      List<List<String>> lines = new ArrayList<>();
      Scanner scanner = new Scanner(file);
      while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        if (line.startsWith(lineName)) {
          List<String> segments = List.of(line.split("\\*"));
          lines.add(segments);
        }
      }
      scanner.close();
      return lines;
    } catch (FileNotFoundException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
    return null;
  }

  public void printEbLine(List<String> line) {
    System.out.println("EB Line: " + line);
    if (line.size() > 1) System.out.println("EB01 Benefit Info: " + eb01Map.get(line.get(1)));
    if (line.size() > 2) System.out.println("EB02 Coverage Level: " + eb02Map.get(line.get(2)));

    if (line.size() > 3)
      List.of(line.get(3).split("\\^"))
          .forEach((stc) -> System.out.println("EB03 Service Type Code: " + eb03Map.get(stc)));

    if (line.size() > 4)
      System.out.println("EB04 Insurance Type Code: " + eb04Map.get(line.get(4)));
    if (line.size() > 5) System.out.println("EB05 Plan Coverage Description: " + line.get(5));
    if (line.size() > 6)
      System.out.println("EB06 Time Period Qualifier: " + eb06Map.get(line.get(6)));
    if (line.size() > 7) System.out.println("EB07 Monetary Amount: " + line.get(7));
    if (line.size() > 8) System.out.println("EB08 Percent: " + line.get(8));
    if (line.size() > 9) System.out.println("EB09 Quantity Qualifier: " + line.get(9));
    if (line.size() > 10) System.out.println("EB10 Quantity: " + line.get(10));
    if (line.size() > 11) System.out.println("EB11 Yes/No Cond Resp Code: " + line.get(11));
    if (line.size() > 12) System.out.println("EB12 Yes/No Cond Resp Code: " + line.get(12));
    if (line.size() > 13) System.out.println("EB12 Comp. Med Proced. ID: " + line.get(13));
    if (line.size() > 14) System.out.println("EB12 Comp. Diag. Code Code Point.: " + line.get(14));
    System.out.println();
  }

  public List<List<String>> filterEbLines(
      List<List<String>> lines, int segmentIndex, String segmentCode) {
    return lines.stream()
        .filter(
            (line) ->
                line.size() > segmentIndex
                    && (segmentIndex == 3
                        ? line.get(segmentIndex).contains(segmentCode)
                        : line.get(segmentIndex).equals(segmentCode)))
        .collect(Collectors.toList());
  }

  public List<List<String>> filterNm1Lines(
      List<List<String>> lines, int segmentIndex, String segmentCode) {
    return lines.stream()
        .filter((line) -> line.size() > segmentIndex && line.get(segmentIndex).equals(segmentCode))
        .collect(Collectors.toList());
  }
}
