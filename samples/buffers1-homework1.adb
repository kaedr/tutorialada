pragma SPARK_Mode (On);

with Ada.Text_IO;

package body Buffers1.Homework1 is
   procedure Immutable_Sort (Input : in Buffer_Type; Output : out Buffer_Type)
   is
      Next, Temp : Character;
   begin
      Output := (others => ' ');
      for InputIndex in Input'Range loop
         Next := Input (InputIndex);
         for OutputIndex in 1 .. InputIndex loop
            if InputIndex = OutputIndex then
               Output (OutputIndex) := Next;
            elsif Next > Output (OutputIndex) then
               -- Shift the remaining elements to the right
               Output(OutputIndex + 1 .. InputIndex) := Output(OutputIndex .. InputIndex - 1);
               Output (OutputIndex) := Next;
               exit;
            end if;
            pragma Loop_Invariant (for some J in 1..InputIndex => Output (OutputIndex) = Input(J));
         end loop;
         pragma Loop_Invariant
           (for some L in 1 .. InputIndex => Output (L) = Input (InputIndex));
      end loop;
   end Immutable_Sort;

end Buffers1.Homework1;
