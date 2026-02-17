settings.log.level := 3

music_dir = environment.get("MUSIC_DIR")

def fix_metadata(meta) =
  if meta["title"] == "" and meta["filename"] != "" then
    new_title = path.remove_extension(path.basename(meta["filename"]))
    [("title", new_title)]
  else
    []
  end
end

pl = playlist(music_dir, reload_mode="rounds", reload=1)

radio_source = mksafe(metadata.map(fix_metadata, pl))

output.icecast(
  %ogg(%opus(
    samplerate=48000,
    channels=2,
    bitrate=320
  )),
  host=environment.get("ICECAST_HOST"),
  port=int_of_string(environment.get("ICECAST_PORT")),
  password=environment.get("ICECAST_PASSWORD"),
  mount=environment.get("ICECAST_MOUNT"),
  name="SESS.DN42 Freedom Music Radio",
  description="I'm cute, please give me money~",
  fallible=true,
  radio_source
)
