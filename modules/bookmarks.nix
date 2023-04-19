_:
let
  DEVS = "$HOME/devs";
  INFO = "$HOME/docs/info";
in
{
  home.shellAliases = {
    dt = "cd $HOME/desktop";
    bin = "cd $HOME/.local/bin";
    tg = "cd $HOME/downloads/Telegram\ Desktop";
    dwn = "cd $HOME/downloads";
    dnd = "cd ${DEVS}/dnd";
    docs = "cd $HOME/docs/";
    books = "cd $HOME/docs/books";
    cards = "$EDITOR ${INFO}/card.yml";
    infos = "$EDITOR ${INFO}/info.yml";
    devs = "cd ${DEVS}";
    egfront = "cd ${DEVS}/estateguru-frontend";
    charity = "cd ${DEVS}/the-charity-frontend";
    notion-icons = "cd ${DEVS}/notion-icons";
  };
}
