class EnvExtractor
  def extensions
    %w(ru thor rake rb yml ruby yaml erb builder markerb haml)
  end

  def extract_env_vars(globs = '*')
    results = Hash.new { |hash, key| hash[key] = [] }

    Array(globs).each do |glob|
      Dir.glob(glob).each do |item|
        next if File.basename(item)[0] == ?.

        if File.directory?(item)
          results.merge!(extract_env_vars("#{item}/*"))
        else
          next unless extensions.detect {|ext| File.extname(item)[ext] }
          File.readlines(item).each_with_index do |line, ix|
            capture_variables(line).each do |variable|
              results[variable] << { :path => item, :line => ix.succ }
            end
          end
        end
      end
    end

    results
  end

  private

  def capture_variables(line)
    line.scan(/ENV(?:\[|\.fetch\()['"]([^'"]+)['"]/).flatten
  end
end
