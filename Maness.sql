<<Maness>>
Declare
   num_check number;
   rent_check number;
   new_c_id customers.c_id%type := &c_id;
   new_v_id rentals.v_id%type := &v_id;
   cur_date date := SYSDATE;
   new_miles_out rentals.miles_out%type := &miles_out;
  Begin
   Select count(*) into num_check from customers where c_id = new_c_id;
  if num_check = 0 then
      dbms_output.put_line('Invalid c_id');
      Return;
  End if;
   Select count(*) into num_check from vehicles where id = new_v_id;
  if num_check = 0 then
      dbms_output.put_line('Invalid v_id');
      Return;
  End if;
   Select count(ret_date) into num_check from rentals where v_id = new_v_id;
   Select count(v_id) into rent_check from rentals where v_id = new_v_id;
  if rent_check > num_check then
      dbms_output.put_line('Car already checked out');
      Return;
  End if; 
  Insert into rentals (c_id, v_id, ck_out_date, miles_out) values(new_c_id, new_v_id, cur_date, new_miles_out);
dbms_output.put_line('Data added successfully');
   End Maness; 
   /