pragma SPARK_Mode (On);

package Buffers1.Homework1 is
   procedure Immutable_Sort
     (Input : in Buffer_Type; Output : out Buffer_Type) with
     Post =>
      (for all I in Output'Range =>
         (for some J in Input'Range => Output (I) = Input (J))); --and
      --(for all I in Input'Range =>
         --(for some J in Output'Range => Input (I) = Output (J)));
end Buffers1.Homework1;
