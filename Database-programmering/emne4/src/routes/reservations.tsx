import { Title } from "@solidjs/meta";

import { createReservation } from "~/lib/models";

const onCreateReservation = () => {
  createReservation("test2", new Date()).then(() => console.log("Reservation created"));
}

export default function Home() {
  return (
    <main>
      <Title>Reservations</Title>
      <h1>Reservations</h1>
      <button onclick={onCreateReservation}>Create Reservations</button>
    </main>
  );
}
