import { Title } from "@solidjs/meta";

import Table from "~/components/RestaurantTable";

import { createRestaurant } from "~/lib/models";

const onCreateRestaurant = () => {
  createRestaurant("test", "test", "test").then(() => console.log("Restaurant created"));
}

export default function Home() {
  return (
    <main>
      <Title>Restaurants</Title>
      <h1>Restaurants</h1>
      <button onclick={onCreateRestaurant}>Create Restuaurant</button>
      <Table />
    </main>
  );
}
