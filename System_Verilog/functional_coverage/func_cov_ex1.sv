class dut;
  rand bit [3:0] addr;
  rand bit [2:0] data;
  rand bit enb;
endclass

class coverage;
  dut obj;
  covergroup cvg_gps;
    CP_ADDR: coverpoint obj.addr {
      bins range1 = {[0:5]};
      bins range2[] = {[10:15]};
      bins range3[] = {[6:9]};
      option.weight = 3;
    }
    CP_DATA: coverpoint obj.data {
      bins range1 = {[0:3]};
      bins range2[] = {[4:7]};
      option.weight = 6;
    }
    ALL_X: cross CP_ADDR, CP_DATA, obj.enb {
      //ignore_bins gnr_reset = (CP_ADDR.range1&&CP_DATA.range1);
    }
    MTHS: cross CP_ADDR, CP_DATA {
      bins rnge1 = MTHS with (CP_DATA inside {[1:2]} && CP_ADDR inside {15}) matches 4;
    }
  endgroup
  function new();
    obj = new();
    cvg_gps = new();
  endfunction
endclass

module tb();
  dut obj1 = new();
  coverage obj_cvg = new();
  initial begin
    repeat(10) begin
    obj_cvg.cvg_gps.sample();
    obj_cvg.obj.randomize();
    $display("values are:%0p", obj_cvg.obj);
    #1;
    end
  end
endmodule
