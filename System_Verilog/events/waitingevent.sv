//Waiting for event to trigger
//using level sensitive wait 
module ev();

event e1,e2;
initial begin

$display("@%0d: 1: before trigger", $time);
$display("e2", e2.triggered);
->e1;
@(e2.triggered);
//wait(e2.triggered);
$display("e2", e2.triggered);
$display("@%0d: 1: after trigger", $time);
end

initial begin
$display("@%0d: 2:before trigger",$time);
$display("e1", e1.triggered);
->e2;
//@(e1.triggered);
wait(e1.triggered);
$display("e1", e1.triggered);
$display("@%0d: after trigger ",$time);
end
endmodule
