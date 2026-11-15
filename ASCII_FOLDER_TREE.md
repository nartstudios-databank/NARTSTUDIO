# ASCII Folder Tree

NARTSTUDIO/                                          Monorepo root

├── _NCU/                                            Nartstudio Comic Universe division
│   ├── _STYLE_PACKAGE/                              Style bible exports (Notion is source of truth)
│   ├── _TEMPLATES/                                  Layer templates & Blender starters
│   ├── _REFERENCE/                                  Reference images and mood boards
│   ├── _IPs/                                        Per-IP folders
│   │   ├── MyHeroIP/                                Example IP
│   │   │   ├── 01_SCRIPT/                           Script handoff (written by Creative Dir/Writer)
│   │   │   │   └── CH01_v01.ext                     Script document
│   │   │   ├── 02_STORYBOARD/                       Storyboard artist
│   │   │   │   └── CH01_v01.ext                     Storyboard file
│   │   │   ├── 03_LAYOUT/                             Layout + 3D + balloons
│   │   │   │   └── CH01_v01.ext                     Layout/3D scene
│   │   │   ├── 04_LINES_FG/                          Line art (corrected from LINKS_FG)
│   │   │   │   ├── CH01_v01_l1.png                    Primary line art
│   │   │   │   └── CH01_v01_l2.png                    Secondary line pass
│   │   │   ├── 05_FLATS/                              Flats
│   │   │   │   └── CH01_v01_f1.tif                    Base flats
│   │   │   ├── 06_RENDER/                             Render and FX
│   │   │   │   └── CH01_v01_r1.exr                   Render pass
│   │   │   ├── 07_FINAL/                              Final lettering
│   │   │   │   └── CH01_v01_f1.pdf                    Letterled final
│   │   │   └── 08_QA/                                 QA and format split
│   │   │       ├── CH01_v01_p1.CMYK                   Print CMYK version
│   │   │       └── CH01_v01_w1.WEBTOON              Webtoon RGB version
│   │   │       └── DELIVERY/                          Delivery handoff
│   │   │           └── CH01_v01_delivered.zip
│   │   │
│   │   └── ...                                        Other IPs
│   │
│   └── _ARCHIVE/                                    Archived finished chapters
│       └── CH01/                                      Old version folder
│
├── _OUBYT/                                          2D/3D animation division (shares early stages)
│   ├── _STYLE_PACKAGE/
│   ├── _TEMPLATES/
│   ├── _REFERENCE/
│   ├── _SHOTS/                                      Per-shot/sequence folders
│   │   ├── Shot01/                                  
│   │   │   ├── 01_SCRIPT/
│   │   │   ├── 02_STORYBOARD/
│   │   │   ├── 03_LAYOUT/                            Shared early stages
│   │   │   ├── 04_LINES_FG/
│   │   │   ├── 05_FLATS/
│   │   │   ├── 06_RENDER/
│   │   │   └── 08_QA/
│   │   │       ├── PRINT_CMYK/
│   │   │       └── WEBTOON_RGB/
│   │   │
│   │   └── _ARCHIVE/
│
├── _STYLE_PACKAGE/                                  Studio-wide style package exports
├── _TEMPLATES/                                      Layer templates & Blender starter files
├── _REFERENCE/                                      Reference images
├── _DELIVERY/                                       Current delivery queue
└── _ARCHIVE/                                        Finished/chapter archives