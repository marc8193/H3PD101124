import { MetaProvider, Title } from "@solidjs/meta";
import { Router } from "@solidjs/router";
import { FileRoutes } from "@solidjs/start/router";
import { Suspense } from "solid-js";
import "./app.css";

import "~/lib/models";

export default function App() {
  return (
    <Router
      root={props => (
        <MetaProvider>
          <Title>MongoDB tutorial</Title>
          <a href="/">Home</a>
          <a href="/restaurants">Restaurants</a>
          <a href="/reservations">Reservations</a>
          <Suspense>{props.children}</Suspense>
        </MetaProvider>
      )}
    >
      <FileRoutes />
    </Router>
  );
}
