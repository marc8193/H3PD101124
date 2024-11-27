import { Title } from "@solidjs/meta";

import Table from "~/components/Table";

interface Record {
  name: String,
}

var records = Array<Record> ({ name: "test1" }, { name: "test2" })

export default function Home() {
  return (
    <main>
      <Title>Home</Title>
      <h1>MongoDB tutorial</h1>
      <Table />
    </main>
  );
}
