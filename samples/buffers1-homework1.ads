pragma SPARK_Mode (On);
with Ada;
with Ada.Characters.Latin_1;

package Buffers1.Homework1 is
   function Sorted
     (BT : Buffer_Type; Stop : Buffer_Index_Type) return Boolean is
     (if Stop > 1 then
        (for all I in BT'First + 1 .. Stop => BT (I - 1) >= BT (I))) with
     Ghost;

   procedure Immutable_Sort
     (Input : in Buffer_Type; Output : out Buffer_Type) with
     Pre  =>
      (for all I in Input'Range => Input (I) /= Ada.Characters.Latin_1.NUL),
     Post =>
      (for all I in Output'Range =>
         (for some J in Input'Range => Output (I) = Input (J))) and
      (for all I in Input'Range =>
         (for some J in Output'Range => Input (I) = Output (J))) and
      (Sorted (Output, Output'Last));
end Buffers1.Homework1;
