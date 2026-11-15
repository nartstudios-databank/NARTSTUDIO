# Pull Request Template — QA Handoff and Sign-off

## Purpose

This pull request is for QA review and Creative Director sign-off before a chapter moves to Delivery and Archive.

## PR Checklist

### QA Handoff
- [ ] All 8 pipeline stages are complete (01_SCRIPT through 08_QA)
- [ ] Final outputs exist in both `PRINT_CMYK` and `WEBTOON_RGB`
- [ ] All filenames follow the naming convention (`NAMING_CONVENTION.md`)
- [ ] LFS files are properly tracked (grey pointer on github.com)
- [ ] No temp/cache files remain in the commit
- [ ] Lockable files (.clip, .psd, .blend) are unlocked (no exclusive lock pending)

### Creative Director Sign-off
- [ ] Print CMYK version reviewed and approved
- [ ] Webtoon RGB version reviewed and approved
- [ ] Story/budget compliance confirmed (refer to Notion Story Bible)
- [ ] Ready for Delivery

### Delivery
- [ ] Delivery zip prepared and uploaded to Notion/SharePoint
- [ ] Archive folder updated with final versions

## PR Description

Please describe the chapter being submitted:

- **Chapter/Shot:** `NCU_CH001` / `OBT_Shot01`
- **Pipeline stages completed:** List each stage and version
- **Final output files:** List PRINT_CMYK and WEBTOON_RGB files
- **Known issues or notes:**

---

*This PR requires approval from the Creative Director (CODEOWNERS) and Production Manager for structure changes.*