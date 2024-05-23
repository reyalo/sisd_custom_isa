module processor(
  
  input wire clk,
  input wire reset,

  input wire [31:0] instruction,
  
  // output wire [31:0] result,

  // for debug

  output wire [1:0] counter_val_o,

  //

  output wire [127:0] reg_read_data21_wire,
  output wire [127:0] reg_read_data22_wire,
  output wire [127:0] reg_write_data2_wire,


  output wire [31:0] mem_write_data2_wire
  // output wire [31:0] reg_read_data1_wire,
  // output wire [31:0] reg_read_data2_wire,
  // output wire [31:0] reg_write_data_wire,



  // output wire zero_flag

);

  wire [3:0] op_wire;

  wire [3:0] reg_read_address1_wire;
  wire [3:0] reg_read_address2_wire;

  wire reg_write_enable_wire;
  wire [3:0] reg_write_address_wire;
  // wire [31:0] reg_write_data_wire;

  // wire [31:0] reg_read_data1_wire;
  // wire [31:0] reg_read_data2_wire;

  wire immidiate_en_wire;
  wire [31:0] immidiate_data_wire;



  // for memory I/O operation

  wire [7:0] output_rw_address;

  wire vector;
  wire [1:0] counter_val;

  wire mem_load_enable;
  wire [1:0] mem_load_select;

  wire [3:0] mem_read_address1_wire; //! todo add maybe 8 bit
  // wire [7:0] mem_read_address2_wire; //! todo add maybe 8 bit

  wire [31:0] mem_read_data1_wire;
  wire [31:0] mem_read_data2_wire;


  // for memory write data

  wire mem_write_enable;

  // wire [7:0] mem_write_address2_wire;
  // wire [31:0] mem_write_data2_wire;




  // mem_read_address_multiplexer
  // assign mem_read_address2_wire = ()

  // always @* begin
    assign reg_write_data2_wire = ( mem_load_enable ? mem_read_data2_wire : 127'b0 );
    // assign reg_write_data_wire = (mem_load_enable? mem_read_data2_wire : result);

    // assign counter_val_o = counter_val;
    
  // end

    assign mem_write_data2_wire = counter_val_o[1] ?
      ( counter_val_o[0] ?
          reg_read_data21_wire[127:96] :
          reg_read_data21_wire[95:64] 
      ) :
      (counter_val_o[0] ?
          reg_read_data21_wire[63:32] :
          reg_read_data21_wire[31:0]
      );

  counter_column counter_column_connection(

    .clk(clk),
    .reset(vector),
    .counter_val(counter_val_o)

  );

  // it add offset to current address of memory
  add_memory_address add_memory_address_connection(

    .address(immidiate_data_wire[7:0]), 
    .offset(counter_val_o),

    .outputAddress( output_rw_address)

  );


  control_unit control_unit_connection(

    .instruction(instruction),     //! input_of_current_module

    .op(op_wire),

    .reg_read_address1(reg_read_address1_wire),
    .reg_read_address2(reg_read_address2_wire),

    .reg_write_enable(reg_write_enable_wire),
    .reg_write_address(reg_write_address_wire),

    .immidiate_en(immidiate_en_wire),
    .immidiate_data(immidiate_data_wire),

    // .jump_en(jump_en_wire),
    // .jump_address(jump_address_wire),


    //* for memory load operation

    .mem_load_enable(mem_load_enable),
    .mem_load_select(mem_load_select),

    //* for memory store operation
    // .mem_store(mem_store_wire)
    .mem_write_enable(mem_write_enable),

    .vector(vector)

  );


  memory memory_connection(

  .clk(clk),


  // memory read 
  .read_address2(mem_load_enable? output_rw_address: 8'bx),  // for LD r0, [3]

  .read_data2(mem_read_data2_wire),



  // memory write 
  .mem_write_enable(mem_write_enable),

  .write_address(mem_write_enable ? (immidiate_data_wire[7:0] + counter_val_o) : 8'bx), // for ST [3],r0
  // .write_address(mem_write_enable ? output_rw_address : 8'bx), // for ST [3],r0
  // .write_address(output_rw_address), // for ST [3],r0

  // .write_data(reg_read_data21_wire[31:0])  // for ST [3], r0;
  .write_data( counter_val_o[1] ?
      ( counter_val_o[0] ?
          reg_read_data21_wire[127:96] :
          reg_read_data21_wire[95:64] 
      ) :
      (counter_val_o[0] ?
          reg_read_data21_wire[63:32] :
          reg_read_data21_wire[31:0]
      )
  )  // for ST [3], r0;


  );

  RegisterSet2 register_set_connection(

    .clk(clk),   //! input of current module
    .reset(reset), //! input of current module

    .writeEnable(reg_write_enable_wire),
    .mem_load_enable(mem_load_enable),

    .readAddress1(reg_read_address1_wire),
    .readAddress2(reg_read_address2_wire),
    

    .writeAddressR(reg_write_address_wire),
    .writeAddressC(counter_val_o),

    .writeData( mem_load_enable? mem_read_data2_wire:127'b0 ),
    // .writeData( reg_write_data_wire ),
    // .writeData(reg_write_data_wire),

    .readData1(reg_read_data21_wire),
    .readData2(reg_read_data22_wire)


  );


  // RegisterSet register_set_connection(

  //   .clk(clk),   //! input of current module
  //   .reset(reset), //! input of current module

  //   .readAddress1(reg_read_address1_wire),
  //   .readAddress2(reg_read_address2_wire),
    
  //   .writeEnable(reg_write_enable_wire),
  //   .writeAddress(reg_write_address_wire),

  //   .writeData( mem_load_enable? mem_read_data2_wire : result ),
  //   // .writeData( reg_write_data_wire ),
  //   // .writeData(reg_write_data_wire),

  //   .readData1(reg_read_data1_wire),
  //   .readData2(reg_read_data2_wire)


  // );

  // alu alu_connection(
  //   .operand1(reg_read_data1_wire),
  //   .operand2(immidiate_en_wire ? immidiate_data_wire : reg_read_data2_wire),
  //   .op(op_wire),
    
  //   // .result(reg_write_data_wire),        
  //   .result(result),        //!output_of_current_module
  //   .zero_flag(zero_flag)   //!output_of_current_module


  // );



endmodule