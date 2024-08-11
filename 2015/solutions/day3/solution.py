def part_1(raw_input: str) -> int:
    visited = {(0, 0): True}
    last_visited = (0, 0)

    for direction in raw_input:
        match direction:
            case "^":
                last_visited = (last_visited[0], last_visited[1] + 1)
            case "v":
                last_visited = (last_visited[0], last_visited[1] - 1)
            case "<":
                last_visited = (last_visited[0] - 1, last_visited[1])
            case ">":
                last_visited = (last_visited[0] + 1, last_visited[1])

        visited[last_visited] = True

    return len(visited)


def part_2(raw_input: str) -> int:
    visited = {(0, 0): True}
    last_visited = {
        "S": (0, 0),
        "R": (0, 0)
    }
    who = "S"

    for direction in raw_input:
        match direction:
            case "^":
                last_visited[who] = (last_visited[who][0], last_visited[who][1] + 1)
            case "v":
                last_visited[who] = (last_visited[who][0], last_visited[who][1] - 1)
            case "<":
                last_visited[who] = (last_visited[who][0] - 1, last_visited[who][1])
            case ">":
                last_visited[who] = (last_visited[who][0] + 1, last_visited[who][1])

        visited[last_visited[who]] = True

        who = "S" if who == "R" else "R"

    return len(visited)
