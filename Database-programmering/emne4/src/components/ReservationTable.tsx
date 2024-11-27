import { createResource, For } from "solid-js";

import { getRestaurants } from "~/lib/models";

export default function ReservationTable() {
    const [reservations] = createResource(getRestaurants);

    return (
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Reservation</th>
                    </tr>
                </thead>
                <tbody>
                    <For each={reservations()}>
                        {(item) =>
                            <tr>
                                <th>{item.name}</th>
                            </tr>
                        }
                    </For>
                </tbody>
            </table>
        </div>
    );
}