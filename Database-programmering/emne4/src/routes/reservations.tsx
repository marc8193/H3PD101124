import { Title } from "@solidjs/meta";

import ReservationTable from "~/components/ReservationTable";

import { createReservation } from "~/lib/models";

const onCreateReservation = () => {
  createReservation("67446f3968e65edc3a1077d5", Math.floor(new Date().getTime() / 1000)).then(() => console.log("Reservation created"));
}

export default function Home() {
  return (
    <main>
      <Title>Reservations</Title>
      <h1>Reservations</h1>
      <button onclick={onCreateReservation}>Create Reservations</button>
      <ReservationTable />
    </main>
  );
}
