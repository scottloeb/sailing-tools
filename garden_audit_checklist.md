# GARDEN Repository Audit Checklist

**CRITICAL: Execute this checklist FIRST before any other work to preserve chat context as actual files**

## ⚡ IMMEDIATE PRESERVATION (Do First - 15 minutes)

### 📁 Save Chat Artifacts to Repo
- [ ] Save `garden-backlog-manager.html` to `toolshed/` folder
- [ ] Save `garden-version-history.html` to `toolshed/` folder  
- [ ] Save this audit checklist as `AUDIT_CHECKLIST.md` in repo root
- [ ] Create `CURRENT_STATUS.md` documenting what's real vs conceptual

### 📝 Document Critical Decisions
- [ ] Create `FORK_STRATEGY.md` explaining lightweight core + forked projects approach
- [ ] Update `README.md` with current project structure and status
- [ ] Create `NAMING_CONVENTIONS.md` (no dates in CIT filenames, garden-themed tools)

## 🧹 CORE REPOSITORY CLEANUP

### 📋 CIT Consolidation Status
- [x] ~~CIT_GARDENProjectManagement files consolidated~~ (DONE)
- [ ] Verify `CIT_GARDEN_ProjectManagement.md` contains all current info
- [ ] Remove old dated versions of consolidated CITs
- [ ] Update references to use new naming convention

### 🌱 Garden Grafter Renaming
- [ ] Find all references to "Enhanced Garden Uploader" or "Project Deployment Manager"
- [ ] Update to "Garden Grafter v1.0" throughout documentation
- [ ] Update CITs referencing the old name
- [ ] Add Garden Grafter v1.0 to version history

### 📂 File Structure Assessment
- [ ] List all files in root directory
- [ ] List all files in `contexts/` directory  
- [ ] List all files in `toolshed/` directory
- [ ] List all files in `generated/` directory
- [ ] Identify which files belong in core vs. should be forked

## 🍴 PROJECT FORKING PLAN

### 🚢 Projects to Fork Out of Core
- [ ] **Sailing Projects** (SailPlan + SailingWatch CITs)
  - [ ] Create `sailing-projects` forked repo
  - [ ] Move `CIT_SailPlan_20250511.md` and `CIT_SailingWatch_20250522.md`
  - [ ] Consolidate into single `CIT_SailingProjects.md` in new repo
  
- [ ] **Zach Visual Schedule** (Personal project)
  - [ ] Create `zach-visual-schedule` forked repo  
  - [ ] Move `CIT_zVisualSchedule-Z_20250515.md` and `CIT_Zach_20250523.md`
  - [ ] Consolidate into single `CIT_ZachProjects.md` in new repo

- [ ] **Blueberry Coffee Recipe** (Personal project)
  - [ ] Create `recipe-projects` forked repo
  - [ ] Move `CIT_blueberryCoffee_20250517.md`

- [ ] **Budget NodePad** (Tool project)
  - [ ] Create `budget-nodepad` forked repo
  - [ ] Move `CIT_BudgetNodePad_20250523.md`

- [ ] **Garden Grafter** (Infrastructure tool)
  - [ ] Create `garden-grafter` forked repo
  - [ ] Move `CIT_Project_Deployment_Manager_20250525.md`
  - [ ] Rename to `CIT_GardenGrafter.md`

### 📋 Backlog Manager (This Project)
- [ ] Create `garden-backlog-manager` forked repo
- [ ] Move backlog management artifacts and development
- [ ] Plan for eventual contribution back to core

## 🏗️ CORE REPOSITORY STRUCTURE

### 📁 Keep in Core (Essential Only)
- [ ] `contexts/CIT_GARDEN_ProjectManagement.md` (main project context)
- [ ] `contexts/CIT_Personal.md` (Scott's context for collaboration)
- [ ] `contexts/CIT_ActionOrganizer.md` (core workflow)
- [ ] `contexts/behindTheScenes/CIT_ADAcompliance.md` (core standards)
- [ ] `contexts/behindTheScenes/CIT_Brand_Style_Guide.md` (core standards)  
- [ ] `contexts/behindTheScenes/CIT_Version_Control.md` (core standards)
- [ ] `contexts/behindTheScenes/CIT_meta-cit-framework.md` (core framework)

### 🗑️ Clean Up Legacy Folders
- [ ] Review `corpStrat/` folder - migrate valuable content, archive rest
- [ ] Review `experiments/` folder - migrate valuable content, archive rest  
- [ ] Review `features/` folder - migrate valuable content, archive rest
- [ ] Move `contexts/behindTheScenes/` contents to main `contexts/` folder

### 🧰 Toolshed Organization
- [ ] Inventory all tools in `toolshed/` directory
- [ ] Document what each tool does in `toolshed/README.md`
- [ ] Identify which tools are stable vs. experimental
- [ ] Plan version tracking for actively developed tools

## ✅ VALIDATION STEPS

### 🔍 Core Lightweight Check
- [ ] Core repository has minimal, essential files only
- [ ] All project-specific work moved to forked repositories
- [ ] README clearly explains core purpose and fork strategy
- [ ] Can use entire core repo as Claude project knowledge without bloat

### 📊 Documentation Completeness  
- [ ] All active projects have clear CIT documentation
- [ ] All tools have basic usage documentation
- [ ] Version history covers all production deployments
- [ ] Fork strategy is documented and implementable

### 🚀 Production Validation
- [ ] All production applications still accessible and functional
- [ ] All forked repositories created and accessible
- [ ] Core repository structure is clean and navigable
- [ ] New chat can pick up work without missing context

## 🎯 SUCCESS CRITERIA

**Audit Complete When:**
- [ ] All chat concepts are preserved as actual files
- [ ] Core repository contains only essential GARDEN framework files
- [ ] Project-specific work is properly organized in forked repositories
- [ ] Documentation is complete and can be referenced without chat history
- [ ] New development can proceed with clean separation of concerns

## 📋 POST-AUDIT NEXT STEPS

1. **Test the Garden Grafter** - Create a new project fork to validate the tooling
2. **Refine Backlog Manager** - Continue development in its own forked repository  
3. **Document Fork Workflow** - Create step-by-step guide for future projects
4. **Plan Template Expansion** - Add new NodePad templates to Garden Grafter
5. **Validate Production** - Ensure all deployed applications continue working

---

**⚠️ CRITICAL REMINDER: Execute "IMMEDIATE PRESERVATION" section FIRST before any other work!**

*This audit preserves months of architectural work and enables sustainable development going forward.*