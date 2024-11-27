import { createResource, For } from "solid-js";

import { getRestaurants } from "~/lib/models";

export default function RestaurantTable() {
    const [restaurants] = createResource(getRestaurants);

    console.log(restaurants());

    return (
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Cuisine</th>
                        <th>Borough</th>
                    </tr>
                </thead>
                <tbody>
                    <For each={restaurants()}>
                        {(item) =>
                            <tr>
                                <th>{item.name}</th>
                                <th>{item.cuisine}</th>
                                <th>{item.borough}</th>
                            </tr>
                        }
                    </For>
                </tbody>
            </table>
        </div>
    );
}