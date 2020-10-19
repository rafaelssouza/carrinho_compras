After do |scenario|
    scenario_name = Time.new.strftime("%d-%m-%Y-%H-%M-%S").to_s

    if scenario.failed?
        tirar_foto(scenario_name, 'falhou')
    elsif
        tirar_foto(scenario_name, 'passou')
    end
    
end