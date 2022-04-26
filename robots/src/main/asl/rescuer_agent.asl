facing(top).
position(0, 0).
status(exploring).

!rescue.

+!rescue <-
    !explore;
    !come_back.

+!explore : not(status(exploring)) <- true.
+!explore : status(exploring) <-
    utils.rand_int(N, 1, 20);
    .print("I'll go this way for ", N, " steps");
    !go_on(N);
    !change_direction;
    !explore.
-!explore : status(exploring) <-
    !change_direction;
    .print("Let's go home!")
    !explore.

+!come_back <- .fail. /* TODO */

+!go_on(0) <- true.
+!go_on(N) : N > 0 & free(forward) <-
    !go(forward);
    !go_on(N - 1).
+!go_on(_) : obstacle(forward) <- true.

+!change_direction : obstacle(left) & obstacle(right) <-
    .print("Let's turn back");
    !go(backward).
+!change_direction : obstacle(left) & free(right) <-
    .print("Let's turn right");
    !go(right).
+!change_direction : free(left) & obstacle(right) <-
    .print("Let's turn left");
    !go(left).
+!change_direction : free(left) & free(right) <-
    .random(X);
    if (X >= 0.5) {
        .print("Let's turn right");
        !go(right)
    } else {
        .print("Let's turn left");
        !go(left)
    }.

+!go(Direction) : free(Direction) <-
    move(Direction);
    utils.update_pose(Direction).
-!go(Direction) : free(Direction) <-
    .print("Ooops!");
    !go(Direction).

+position(X, Y) <- .print("I'm in (", X, ", ", Y, ")").

+neighbour(Agent) : status(exploring) <-
    .print("Hello ", Agent, "! Follow me!").
