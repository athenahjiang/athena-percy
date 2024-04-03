import React from "react";

import { Root } from "@athena/forge";

import createBEMHelper from "../../bem-helper";
import { forgeTheme } from "../../nimbus-config";
import PercyButton from "./PercyButton";
import PercyLightbox from "./PercyLightbox";

// Use this function in your React components to establish a
// BEM class name scope for the component and its elements.
const classes = createBEMHelper({
  name: "app"
});

export interface AppProps {
  contextId: number;
  patientId: number;
  patientInsuranceId: number;
  apiBaseUrl: string;
}

export default function App({
  contextId,
  patientId,
  patientInsuranceId,
  apiBaseUrl
}: AppProps): JSX.Element {
  const [lighboxShown, setLightboxShown] = React.useState<boolean>(false);

  return (
    /* This theme must be applied in order for Nimbus CSS namespacing to work */
    <Root {...classes()} theme={forgeTheme}>
      <PercyButton setLightboxShown={setLightboxShown}></PercyButton>
      <PercyLightbox
        contextId={contextId}
        patientId={patientId}
        patientInsuranceId={patientInsuranceId}
        apiBaseUrl={apiBaseUrl}
        lighboxShown={lighboxShown}
        setLightboxShown={setLightboxShown}
      ></PercyLightbox>
    </Root>
  );
}
