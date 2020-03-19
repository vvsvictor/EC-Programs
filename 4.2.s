func:
    ble $a1, $a2, end
    la $t0, N
    lw $t0, 0($t0)
    mult $a1, $t0 #i*N
    mflo $t1
    addu $t1, $t1, $a0 #&mat + i*N
    addu $t1, $t1, $a2 # &mat[i][j]
    mult $a2, $t0 #j*N
    mflo $t2
    addu $t2, $t2, $a0 # &mat + i*N
    addu $t2, $t2, $a1 #&mat[j][i]
    lw $t2, 0($t2) # mat[j][i]
    sw $t2, 0($t1) # mat[i][j] = mat [j][i]
end:
