"""
命令セット
R型 [7:0]opcode, [12:8]rd1, [17:13]rd2, [22:18] rw, [31:23] 空き （計算に使う命令）
L型 [7:0]opcode==4, [8:12] r, [22:13]memory, [31:23]空き （データメモリからレジスタにデータ書き込みする命令）
W型 [7:0]opcode==5, [8:12] r, [22:13]memory, [31:23]空き  （レジスタからデータメモリにデータ書き込みする命令）

単純にR型は
opcode==0: 足し算
opcode==1: 引き算
opcode==2: 掛け算
opcode==3: 割り算
とします。
"""

get_bin = lambda x: format(x, 'b')

def type_r(opcode, r1, r2, ro):
    return "0"*9 + get_bin(ro).zfill(5) + get_bin(r2).zfill(5) \
    + get_bin(r1).zfill(5) + get_bin(opcode).zfill(8)

def type_l(memory, r):
    return "0"*9 + get_bin(memory).zfill(10) \
    + get_bin(r).zfill(5) + get_bin(4).zfill(8)

def type_w(memory, r):
    return "0"*9 + get_bin(memory).zfill(10) \
    + get_bin(r).zfill(5) + get_bin(5).zfill(8)

# load DATA[0] to $0
print(type_l(0, 0))

# load DATA[1] to $1
print(type_l(1, 1))

# compute adder and store in $2
print(type_r(0, 0, 1, 2))

# store results in DATA[2]
print(type_w(2, 2))

# compute sub and store in $3
print(type_r(1, 0, 1, 2))

