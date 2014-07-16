class PokeMailer < ActionMailer::Base
  default from: "Guilherme - Meu Rio <guilherme@meurio.org.br>"
  layout "mail"

  def thanks_for_poke poke
    @poke = poke
    @organization = Organization.find_by_slug('meurio')
    headers["X-MC-Tags"] = "tribunais,thanks_for_poke"
    mail(to: @poke.user.email, subject: "Passo 1 da missão pela Desmilitarização da Justiça")
  end

  def fight_against_the_abuse_on_the_trains poke
    headers["X-MC-Tags"] = "naopassarao,fight_against_the_abuse_on_the_trains"
    mail(
      subject: "Exijo que o Metrô combata ativamente o abuso sexual em vagões e estações!",
      from: "#{poke.user.first_name} #{poke.user.last_name} <#{poke.user.email}>",
      to: TARGETS_EMAILS)
  end
end
