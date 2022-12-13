# Set calculator using Ruby

This ruby project implements a *set calculator* which can handle a list of operations on three **binary search trees**, based on the provided commands.

The available commands are:

+ *X values* — This command takes a comma-separated list of numeric arguments denoted by values. Now sets X is initialized to the values specified on the command line. The previous content of X is lost.
+ *Y values* — This command is similar to command X above, except that it resets the content of set Y.
+ *Z values* — This command is similar to command X above, except that it resets the content of set Z.
+ *a i* — Numeric argument *i* is **inserted** in an appropriate location in set X. The other two sets are not modified. Insertion preserves the BST properties of set X.
+ *r* — The content of the 3 sets is **rotated**. Set Y takes the content of X; set Z takes the content of Y; and set X takes the previous content of Z. The BSTs are not modified or copied in this operation.
+ *s* — The contents of sets X and Y are **switched**. The BSTs are not modified or copied in this operation.
+ *u* — This command takes the **union** of sets X and Y. The result set is stored as X.
+ *i* — This command takes the **intersection** of sets X and Y. The result set is stored as X.
+ *c* — Set X is recursively **deep copied** into set Y. The previous content of Y is lost. After this command is executed, sets X and Y may not share any data structures.
+ *l aString* — This command takes a string argument defining a one-argument *lambda experssion*. This lambda is applied to every element of set X. The result of each lambda execution is output on the console. Set X is not modified.
+ *q* — This command quits the project.
