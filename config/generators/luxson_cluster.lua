config["luxson cluster"] = {
    prefix = false,
    id = "Luxson Cluster",
    zone = {
        { {
              id = "Luxson",
              subzone = {
                  { "East Luxson", UNCOMMON },
                  { {
                        id = "West Luxson",
                        city = { { "Conduit", COMMON }, { "", COMMON } },
                    }, UNCOMMON },
                  { "Coastal Ring", RARE },
                  { "", COMMON }
              },
          }, COMMON },
        { {
              id = "Monte",
              subzone = {
                  { {
                        id = "Joker District",
                        city = { { "Discard", COMMON }, { "", COMMON } },
                    }, UNCOMMON },
                  { {
                        id = "Diamond District",
                        city = { { "Deuce", COMMON }, { "", COMMON } },
                    }, UNCOMMON },
                  { {
                        id = "Hearts District",
                        city = { { "Shuffle", COMMON }, { "", COMMON } },
                    }, UNCOMMON },
                  { {
                        id = "Clubs District",
                        city = { { "Knave", COMMON }, { "", COMMON } },
                    }, UNCOMMON },
                  { {
                        id = "Spades District",
                        city = { { "Solitaire", COMMON }, { "", COMMON } },
                    }, UNCOMMON },
                  { "", COMMON }
              },
          }, COMMON },
        { {
              id = "Fallow's Island",
              city = { { "Thicket", COMMON }, { "", COMMON } }
          }, COMMON },
    }
}
