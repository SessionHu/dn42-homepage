%include "secret.liq"

settings.log.level := 3

music_dir = "/home/sess/Music"

def fix_metadata(meta) =
  if meta["title"] == "" and meta["filename"] != "" then
    new_title = path.remove_extension(path.basename(meta["filename"]))
    [("title", new_title)]
  else
    []
  end
end

# defined in secret.liq
# icecast_host =
# icecast_port =
# icecast_password =
# icecast_mount =

pl = playlist(music_dir, reload_mode="rounds", reload=1)

radio_source = mksafe(metadata.map(fix_metadata, pl))

output.icecast(
  %vorbis(
    channels=2,
    samplerate=48000,
    quality=.6
  ),
  host=icecast_host,
  port=icecast_port,
  password=icecast_password,
  mount=icecast_mount,
  name="SESS.DN42 Freedom Music Radio",
  description="I'm cute, please give me money~",
  radio_source
)
