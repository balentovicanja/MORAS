(*a*)
Goal forall X Y, ~(X /\ Y) \/ (~X /\ Y) \/ (~X /\ ~Y) <-> ~(X /\ Y).
Proof.
  intros X Y. split.
  - intros A B. destruct A.
    -- apply H. apply B.
    -- destruct H.
      --- now apply H.
      --- now apply H.
  - intros C. left. exact C.
Qed.

(*b*)
Goal forall X Y Z, ~(~X /\ Y /\ ~Z) /\ ~(X /\ Y /\ Z) /\ (X /\ ~Y /\ ~Z) <-> X /\ ~Y /\ ~Z.
Proof.
  intros. split.
  - intros A. destruct A. destruct H0. exact H1.
  - intros A. split.
    -- intros n. apply n. destruct A, n. contradiction.
    -- split.
      --- intros n. destruct A, n. destruct H0, H2. contradiction.
      --- exact A.
Qed.  


