import React from "react";

import { render, cleanup, screen } from "@testing-library/react";
import "@testing-library/jest-dom/extend-expect";

import App from "./App";

describe("Component: App", () => {
  afterEach(cleanup);

  it("renders without crashing", () => {
    // render(<App />);
    // expect(screen.getByText("Nimbus")).toBeInTheDocument();
  });
});
