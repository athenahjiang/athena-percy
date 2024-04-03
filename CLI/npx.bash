# create
npx create-react-app my-app
npx create-react-app . --use-npm --scripts-version @athena/react-scripts --template @athena/cra-template-nimbus-typescript

# generate component
cd root
npx generate-react-cli component MyComponent

# prettier
npx prettier --write .
npx prettier --write "**/*.ts"
npx prettier --write "**/*.tsx"
