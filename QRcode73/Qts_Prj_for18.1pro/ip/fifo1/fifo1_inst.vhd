	component fifo1 is
		port (
			data  : in  std_logic_vector(73 downto 0) := (others => 'X'); -- datain
			wrreq : in  std_logic                     := 'X';             -- wrreq
			rdreq : in  std_logic                     := 'X';             -- rdreq
			clock : in  std_logic                     := 'X';             -- clk
			q     : out std_logic_vector(73 downto 0);                    -- dataout
			usedw : out std_logic_vector(6 downto 0)                      -- usedw
		);
	end component fifo1;

	u0 : component fifo1
		port map (
			data  => CONNECTED_TO_data,  --  fifo_input.datain
			wrreq => CONNECTED_TO_wrreq, --            .wrreq
			rdreq => CONNECTED_TO_rdreq, --            .rdreq
			clock => CONNECTED_TO_clock, --            .clk
			q     => CONNECTED_TO_q,     -- fifo_output.dataout
			usedw => CONNECTED_TO_usedw  --            .usedw
		);

