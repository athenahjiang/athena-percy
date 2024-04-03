import React from "react";
import "./PercyButton.scss";

import { Button } from "@athena/forge";

interface PercyButtonProps {
  setLightboxShown: React.Dispatch<React.SetStateAction<boolean>>;
}

const PercyButton: React.FC<PercyButtonProps> = ({ setLightboxShown }) => {
  return (
    <Button
      id="percy-test-app-button-react"
      onClick={() => setLightboxShown(true)}
    />
  );
};

export default PercyButton;
