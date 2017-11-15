# spi_adc_interface

README
Error while synthesizing the spi_master.v file in the yosys is as follows:

4.2.7. Executing PROC_DFF pass (convert process syncs to FFs).
Creating register for signal `\spi_top.\temp_dout_spi' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:107$20'.
  created $dff cell `$procdff$540' with positive edge clock.
Creating register for signal `\spi_top.\per_addr_spi' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:98$19'.
  created $dff cell `$procdff$541' with positive edge clock.
Creating register for signal `\spi_top.\per_din_spi' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:98$19'.
  created $dff cell `$procdff$542' with positive edge clock.
Creating register for signal `\spi_top.\count_s2p' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:60$14'.
  created $adff cell `$procdff$543' with positive edge clock and negative level reset.
Creating register for signal `\spi_top.\s2p_ready' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:60$14'.
  created $adff cell `$procdff$544' with positive edge clock and negative level reset.
Creating register for signal `\spi_top.\temp_out' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:60$14'.
  created $adff cell `$procdff$545' with positive edge clock and negative level reset.
Creating register for signal `\spi_top.\s2p_out' using process `\spi_top.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_top.v:60$14'.
  created $dff cell `$procdff$546' with positive edge clock.
Creating register for signal `\spi_master.\SS' using process `\spi_master.$proc$/home/hardeep/Desktop/RK/spi_and_adc_RK/spi_master.v:81$7'.
ERROR: Multiple edge sensitive events found for this signal!
