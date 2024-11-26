import { For } from "solid-js";

import { getRestaurants } from "~/lib/models";

export default function Table() {
    return (
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Cuisine</th>
                    <th>Borough</th>
                </tr>
            </thead>
            <tbody>
                <For each={getRestaurants()}>
                    {(item) =>
                        <tr>
                            <th>{item.name}</th>
                            <th>{item.name}</th>
                            <th>{item.name}</th>
                        </tr>
                    }
                </For>
            </tbody>
        </table>
    );
}