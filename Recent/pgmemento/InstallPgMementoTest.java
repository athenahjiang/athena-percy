package com.athenahealth.collector.fdp.pgmemento;

import static org.mockito.Mockito.when;

import java.sql.*;
import org.flywaydb.core.api.migration.Context;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;

public class InstallPgMementoTest {

  private static final String DB_URL = "jdbc:postgresql://localhost:5432/test";
  private static final String USERNAME = "test";
  private static final String PASSWORD = "password";

  @Mock private Context context;
  @Mock private Connection connection;
  @Mock private Statement statement;

  private final InstallPgMemento installPgMemento = new InstallPgMemento();

  @BeforeEach
  void setUp() {
    when(context.getConnection()).thenReturn(connection);
  }

  @Test
  public void migrate() throws Exception {
    installPgMemento.migrate(context);
  }
}
