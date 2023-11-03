def procesar_archivo(ruta, &block)
  correctas = 0
  begin
    File.open(ruta, "r") do |file|
      while line = file.gets
        begin
          puts block.call(line)
          correctas +=1
        rescue StandardError => e
          puts "Error encontrado: #{e.message} (#{e.class})"
        end
      end
    end
  rescue Errno::ENOENT => e
    puts "Error encontrado: #{e.message} (#{e.class})"
  end
  return correctas
end

=begin
procesar_archivo("/home/inaki/Desktop/prueba_numeros.txt"){ |line| puts Integer(line)}
=end
