#include "alt_types.h"
#include "io.h"

#define JUART_DATA_REG_OFT 0	// data register address offset
#define JUART_CTRL_REG_OFT 1	// control register addr offset

/* check # slots available in FIFO buffer */
#define jtaguart_rd_wspace(base) \
	((IORD(base, JUART_CTRL_REG_OFT) & 0xffff0000) >> 16)

/* write an 8-bit char */
#define jtaguart_wr_ch(base, data) \
	IOWR(base, JUART_DATA_REG_OFT, data & 0x000000ff)

/* read an 8-bit char */
#define jtaguart_rd_ch(base) \
	(IORD(base, JUART_DATA_REG_OFT) & 0x000000ff)

#define jtaguart_rd_int(base, data) \
	IOWR(base, JUART_CTRL_REG_OFT, data & 0x1)

void jtaguart_wr_str(alt_u32 jtag_base, char *msg);
unsigned int jtaguart_rd_str(alt_u32 jtag_base, char *buf, unsigned int buf_len);
