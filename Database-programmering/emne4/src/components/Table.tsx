import { For } from "solid-js";

export default function Table<T>(data: Array<T>) {
    return (
        <table>
            <thead>
                <For each={data}>
                    {(object) =>
                        <tr>
                            {/* <For each={Object.keys(object)}>
                                {(key) =>
                                    <th>{key}</th>
                                }
                            </For> */}
                        </tr>
                    }
                </For>
            </thead>
            {/* <tbody>
                <For each={data}>
                    {(object) =>
                        <tr>
                            <For each={object}>
                                {(key) =>
                                    <th>{key}</th>
                                }
                            </For>
                        </tr>
                    }
                </For>
            </tbody> */}
        </table>
    );
}