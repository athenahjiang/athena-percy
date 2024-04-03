import React from "react";
import "./PercyLightbox.scss";

import { Button, Heading, Lightbox, RadioGroup, Table } from "@athena/forge";

interface PercyLightboxProps {
  contextId: number;
  patientId: number;
  patientInsuranceId: number;
  apiBaseUrl: string;
  lighboxShown: boolean;
  setLightboxShown: React.Dispatch<React.SetStateAction<boolean>>;
}

const PercyLightbox: React.FC<PercyLightboxProps> = ({
  contextId,
  patientId,
  patientInsuranceId,
  apiBaseUrl,
  lighboxShown,
  setLightboxShown
}) => {
  const [value, setValue] = React.useState<string>("");

  return (
    <Lightbox
      id="percy-test-app-lightbox"
      headerText="Copays from payer eligibility response (271) for service date - mm/dd/yy"
      show={lighboxShown}
      onHide={() => {
        setLightboxShown(false);
      }}
      height="medium"
      width="large"
    >
      <Heading
        headingTag="h4"
        variant="subsection"
        text="Plan: ABC Healthcare Coverage [123456]"
      />
      <p>
        contextId - {contextId}&nbsp; patientId - {patientId}&nbsp;
        patientInsuranceId - {patientInsuranceId}&nbsp; apiBaseUrl -{" "}
        {apiBaseUrl}&nbsp;
      </p>
      <Table
        columns={[
          { key: "service_type", displayName: "Service Type" },
          { key: "copay", displayName: "Copay" },
          { key: "payer_messages", displayName: "Payer Messages" }
        ]}
        rows={[
          {
            service_type: "Chiropractic",
            copay: (
              <RadioGroup
                id="1"
                options={[
                  { text: "$20 Visit", value: 20 },
                  { text: "$40 Visit", value: 40 }
                ]}
                align="vertical"
                onChange={event => {
                  setValue(event.target.value);
                }}
              />
            ),
            payer_messages: "Medicare covered manipulations"
          },
          {
            service_type: "Hospital Emergency",
            copay: (
              <RadioGroup
                id="2"
                options={[{ text: "$200 Day", value: 200 }]}
                align="vertical"
                onChange={event => {
                  setValue(event.target.value);
                }}
              />
            ),
            payer_messages: ""
          },
          {}
        ]}
      />
      <p>* Indicates Out of Network</p>
      <Button
        id="enter"
        text="Select copay"
        onClick={() => {
          const copayamount = document.getElementById("copayamount");
          if (copayamount) {
            copayamount.inputMode = "numeric";
            copayamount.setAttribute("value", value);
          }
          const todayspayment = document.getElementById("todayspayment");
          if (todayspayment) {
            todayspayment.innerHTML = value;
          }
          setLightboxShown(false);
        }}
        disabled={value === ""}
      ></Button>
    </Lightbox>
  );
};

export default PercyLightbox;
