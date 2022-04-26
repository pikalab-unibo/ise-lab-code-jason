status(lost).

!go_around.

+!go_around : status(lost) <-
    move(random);
    !go_around.
-!go_around : status(lost) <-
    !go_around.
-!go_around : not(status(lost)) <- true.

/* TODO: handle the rescuing scenario */
