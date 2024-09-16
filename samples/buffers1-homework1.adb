pragma SPARK_Mode (On);

with Ada.Text_IO;

package body Buffers1.Homework1 is
   procedure Immutable_Sort (Input : in Buffer_Type; Output : out Buffer_Type)
   is
      Next, Temp : Character;
   begin
      Output := (others => ' ');
      for InputIndex in 1 .. Input'Length loop
         Next := Input (InputIndex);
         for OutputIndex in 1 .. InputIndex loop
            if InputIndex = OutputIndex then
               Output (OutputIndex) := Next;
            elsif Next < Output (OutputIndex) then
               Temp                 := Output (OutputIndex);
               Output (OutputIndex) := Next;
               Next                 := Temp;
            end if;
            pragma Loop_Invariant
              (OutputIndex <= InputIndex and
               (Output (OutputIndex) = Input (InputIndex) or
                Next = Input (InputIndex)));
         end loop;
         pragma Loop_Invariant
           (for some L in 1 .. InputIndex => Output (L) = Input (InputIndex));
      end loop;
   end Immutable_Sort;

end Buffers1.Homework1;
