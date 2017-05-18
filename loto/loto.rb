def loto
    result = [rand(60) + 1, rand(60) + 1, rand(60) + 1, rand(60) + 1, rand(60) + 1, rand(60) + 1].sort
    result.uniq!
    while result.size != 6
      result << rand(60) + 1
      result.uniq!
    end
    return result.sort!
end

def sena(numeros)
    numeros.sort!
    tentativa = 0
    quadra = 0
    quina = 0
    sena = 0

    while 1 < 2
        result = loto
        tentativa += 1
        quadra += 1 if (numeros & result).length == 4
        quina += 1 if (numeros & result).length == 5
        sena += 1 if (numeros & result).length == 6
        if sena == 1
            puts "Tentativa número #{tentativa} - QUADRAS #{quadra} - QUINAS #{quina} - SENAS #{sena} - APOSTA: #{numeros} - RESULTADO: #{result}"
            break
      end
        info = "Tentativa número #{tentativa} - QUADRAS #{quadra} - QUINAS #{quina} - SENAS #{sena} - APOSTA: #{numeros} - RESULTADO: #{result}"
        puts info
    end
end

sena([1,2,3,4,5,6])
